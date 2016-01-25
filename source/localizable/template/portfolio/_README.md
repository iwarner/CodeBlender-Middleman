# Portfolio Module

Creates a portfolio system from a Middleman Blog. Including a recent module to
be utilised for instance on home page; a portfolio template that showcases all
the work and an individual details page showcasing the clicked work.

## Recent

    Useful for inclusion on a home page - shows X recent work.

    -# Portfolio Recent
    = partial "./template/portfolio/recent", locals: { total: "3" }

    Image sizes are based on the column width chosen. Make sure they are
    ( 1170 - ( gutterWidth ( columns * 2 ) ) ) / columns
    ( 1170 - ( 15 * ( columns * 2 ) ) ) / 3

## Portfolio

    Creates the main template to view all the works

## Details Page

    Creates the details page for the portfolio entity, including the following
    information

    * Heading - Title and Small text
    * Meta elements - Author, Image, Title and Type

    All of this information should be part of the portfolio blog entry, either
    part of the text, or within the front-matter.

## Install

    Include all JS
    Include All Style

    Include the Partials in pages you want

## Create the Blog

    Add the portfolio blog

    Create the blog posts with the relevant front-matter