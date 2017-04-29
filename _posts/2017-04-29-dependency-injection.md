---
layout: post
title: "Dependency Injection in Ruby"
date: 2017-04-29T17:13:00-04:00
tags: clean-code, ruby

---

Dependency injection is a technique to decrease and make more explicit the
coupling between two classes by moving a dependency from deep within the
dependent class to its initializer.

## A Tightly Coupled Beginning

To begin with, let's take a simple example of a tightly coupled pair of classes
that aren't using dependency injection. Throughout this post, we'll be using the
case of tracking the `joy` of a `Person` stroking a `Cat`.

```ruby
class Person
  attr_reader :joy

  def initialize(cat_softness)
    @joy = 0
    @cat_softness = cat_softness
  end

  def get_joy
    @joy += Cat.new(@cat_softness).stroke
  end
end

class Cat
  attr_reader :softness, :times_stroked

  def initialize(softness)
    @softness = softness
    @times_stroked = 0
  end

  def stroke
    @times_stroked += 1
    if @times_stroked < 5
      @softness
    else
      -10 # Cat Scratch Fever
    end
  end
end

Person.new(4).get_joy
```

There are a few things to note here. First, the `stroke` method creates a new
`Cat` object. Not only might this be inefficient if stroke is called many times
and a `Cat` is expensive to create and destroy (they tend to bite when you try
to destroy them), it creates a hard binding to a `Cat` specifically. In
particular, we aren't able to stroke any other objects, even if they implement
the `stroke` method.

Second, the `Person` initializer takes arguments pertaining to the `Cat`. This
should be a major smell, as these values make much more sense as part of a `Cat`
initializer.

## Extracting A Dependent Class

In order to remove this coupling, we change the `Person` initializer to accept
a `Cat` object, instead of the parameters needed to create a new `Cat`. Then
each method that was previously creating a `Cat` can instead simply used the
`@cat` instance variable. We then **inject** the dependency in the `Person.new`
call.

```ruby
class Person
  attr_reader :joy

  def initialize(cat)
    @joy = 0
    @cat = cat
  end

  def get_joy
    @joy += cat.stroke
  end
end

class Cat
  # unchanged
end

garfield = Cat.new(4)
Person.new(garfield).get_joy
```

Notice now that the `Cat` exists independently of the
`Person`. It is created outside, in the general runtime code, and will can
persist even if the `Person` is destroyed. The cat, enjoying its independence,
is happy.

We can also see why the technique is called "dependency *injection*". We
*inject* the dependency when the object is initialized, rather than build it
into the object at design time.

## Generalizing Using Dependency Injection

From here it is easy to generalize `Person` to use any type of pet[^1]. For
example, perhaps another pet owner has a `Dog`.

```ruby
class Person
  attr_reader :joy

  def initialize(pet)
    @joy = 0
    @pet = pet
  end

  def get_joy
    @joy += pet.stroke
  end
end

class Cat
  # unchanged
end

class Dog
  attr_reader :softness

  def stroke
    100
  end
end

fido = Dog.new
Person.new(fido).get_joy
```

The `Dog` can have a completely different initialization signature from the
`Cat`, along with a different implementation for `stroke`. All `Person` cares
about is that it *can* be stroked, and that stroking returns something that
makes sense to add to `@joy`.

## When Not To Use It

In our example, the objects in question where basically independent constructs;
a person and her pets---at least as an idea---exist mostly independently of each
other, with only the occasional interaction. Sometimes, objects are tightly
coupled to each other by their very nature, and there is little chance that we
would need to make the dependency modular in the future.

For example, perhaps each `Person` has a `Heart` with properties that are
tightly coupled to the properties of the `Person'. The heart's `@size` may
be directly calculated from the person's `@weight`, for example. Note, in this
example, we still aren't *passing* the heart's parameters into the person's
initializer, but rather *calculating* them from the person's own instance
variables.

This is one good smell test that can identify whether dependency injection
should be avoided. In the real world, it is commonly seen when using utility
and  factory type classes.

[^1]: Indeed, `Person` doesn't need to be changed at all, although renaming the
      `@cat` instance variable to `@pet` would make the code more readable.
