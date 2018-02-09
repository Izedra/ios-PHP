# ios-PHP
Aplicación para iOS que conecta a una base de datos alojada en un servidor donde podremos insertar, modificar y/o borrar registros, además de poder  visualizar el contenido de la tabla en otra instancia de la aplicación.

FirstViewController.swift
· En el ViewController principal se encuentran los 4 texfields que hacen referencia a los cuatro campos que tiene la tabla 'notas'.
· Dependiendo de la operación que queramos llevar a cabo, tendremos que usar los cuatro campos, o prescindiremos del campo 'Nota'
(esto será en el caso de que queramos borrar una nota, ya que solo necesitaremos las claves primarias, que son Alumno, Asignatura y Trimestre)


SecondViewController.swift
· Al acceder a este ViewController, se visualizarán los registros de la tabla en un TableView.
· (A veces, para refrescar la tabla por una modificación realizada, tendremos que reiniciar la aplicación, desconozco el motivo por el momento).
