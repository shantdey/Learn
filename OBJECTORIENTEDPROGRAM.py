"""The set of all methods provided by a class, together with a description of their
behavior, is called the public interface of the class.
Every class has a public interface: a collection of methods through which the objects of the class
can be manipulated."""
'''When you work with an object of a class, you do not know how the object stores
its data, or how the methods are implemented.'''
'''The process of pro­viding a public interface, while hiding the implementation
details, is called encapsulation.'''
'''Encapsulation enables changes in the implementation without affecting
users of a class.'''
'''An object stores its data in instance variables. An instance of a class is an object
of the class.'''
'''By convention, instance variables in Python start with an underscore
to indicate that they should be private'''
'''Instance variables are part of the implementation details that should be hidden from the user of the class. An instance variable
should only be accessed by the methods of its own class.'''