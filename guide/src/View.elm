module View exposing (view)

import Color
import Html
import Html.Attributes as A
import Kit
import Kit.Chunky exposing (..)
import Kit.Components exposing (ButtonSize(..))
import Radix exposing (..)



-- 🖼


view _ =
    [ chunk
        Html.div
        [ "flex"
        , "items-end"
        , "mb-10"
        ]
        []
        [ Html.img
            [ A.src "/images/logo-dark-colored.svg"
            , A.width 210

            -- Dark mode
            ------------
            , A.class "dark:hidden"
            ]
            []

        --
        , Html.img
            [ A.src "/images/logo-light-colored.svg"
            , A.width 210

            -- Dark mode
            ------------
            , A.class "hidden dark:block"
            ]
            []
        ]

    --
    , chunk
        Html.p
        [ "italic"
        , "mb-12"
        ]
        []
        [ Html.text "Styleguide."
        ]

    -----------------------------------------
    -- Colors
    -----------------------------------------
    , let
        colorBlock color colorName widthClass =
            chunk
                Html.div
                [ "h-9"
                , "overflow-hidden"
                , "relative"
                , widthClass

                --
                , "md:h-14"
                ]
                [ A.style "background-color" (Color.toCssString color) ]
                [ chunk
                    Html.div
                    [ "absolute"
                    , "bg-white"
                    , "bottom-0"
                    , "leading-none"
                    , "p-1"
                    , "mb-2"
                    , "mr-2"
                    , "right-0"
                    , "rounded-sm"
                    , "text-[9px]"
                    , "uppercase"

                    --
                    , "md:text-[10px]"

                    -- Dark mode
                    ------------
                    , "dark:bg-base-900"
                    ]
                    []
                    [ Html.text colorName ]
                ]

        colorContainer =
            chunk
                Html.div
                [ "flex"
                , "flex-wrap"
                , "mb-10"
                , "overflow-hidden"
                , "rounded"
                , "shadow"
                ]
                []
      in
      componentContainer
        []
        [ componentTitle "Colors"
        , componentNotes [ Html.text "Base:" ]
        , colorContainer
            [ colorBlock Kit.colors.base_25 "base_25" "w-1/3"
            , colorBlock Kit.colors.base_50 "base_50" "w-1/3"
            , colorBlock Kit.colors.base_100 "base_100" "w-1/3"
            , colorBlock Kit.colors.base_200 "base_200" "w-1/3"
            , colorBlock Kit.colors.base_300 "base_300" "w-1/3"
            , colorBlock Kit.colors.base_400 "base_400" "w-1/3"
            , colorBlock Kit.colors.base_500 "base_500" "w-1/3"
            , colorBlock Kit.colors.base_600 "base_600" "w-1/3"
            , colorBlock Kit.colors.base_700 "base_700" "w-1/3"
            , colorBlock Kit.colors.base_800 "base_800" "w-1/3"
            , colorBlock Kit.colors.base_900 "base_900" "w-1/3"
            , colorBlock Kit.colors.base_950 "base_950" "w-1/3"
            ]

        --
        , componentNotes [ Html.text "Shades:" ]
        , colorContainer
            [ colorBlock Kit.colors.purple "purple" "w-1/3"
            , colorBlock Kit.colors.purple_tint "purple_tint" "w-1/3"
            , colorBlock Kit.colors.purple_shade "purple_shade" "w-1/3"
            , colorBlock Kit.colors.pink "pink" "w-1/3"
            , colorBlock Kit.colors.pink_tint "pink_tint" "w-1/3"
            , colorBlock Kit.colors.pink_shade "pink_shade" "w-1/3"
            , colorBlock Kit.colors.marker_yellow "marker_yellow" "w-1/3"
            , colorBlock Kit.colors.marker_yellow_tint "marker_yellow_tint" "w-1/3"
            , colorBlock Kit.colors.marker_yellow_shade "marker_yellow_shade" "w-1/3"
            ]

        --
        , componentNotes [ Html.text "Other:" ]
        , colorContainer
            [ colorBlock Kit.colors.yellow "yellow" "w-full"

            --
            , colorBlock Kit.colors.black "black" "w-1/4"
            , colorBlock Kit.colors.green "green" "w-1/4"
            , colorBlock Kit.colors.red "red" "w-1/4"
            , colorBlock Kit.colors.white "white" "w-1/4"
            ]
        ]

    -----------------------------------------
    -- Generic button
    -----------------------------------------
    , component
        "Button"
        [ Kit.Components.button
            ExtraSmall
            [ A.class "bg-pink mr-2 text-xs text-white text-opacity-90" ]
            [ Html.text "Button" ]
        , Kit.Components.button
            Small
            [ A.class "bg-pink mr-2 text-sm text-white text-opacity-90" ]
            [ Html.text "Button" ]
        , Kit.Components.button
            Normal
            [ A.class "bg-pink text-white text-opacity-90" ]
            [ Html.text "Button" ]
        ]
        [ Html.text "A good ol' button."
        , lineBreak
        , Html.text "Requires you to set the background color and text color."
        ]
        """
Kit.Components.button
    Normal
    [ class "bg-pink text-white text-opacity-90" ]
    [ text "Button" ]
        """

    -----------------------------------------
    -- Sign in button
    -----------------------------------------
    , component
        "Sign in button"
        [ Kit.Components.signIn
            [ A.class "bg-purple text-white text-opacity-90" ]
        ]
        [ Html.text "Default \"Sign in with Fission\" button."
        , lineBreak
        , Html.text "Requires you to set the background color and text color."
        ]
        """
Kit.Components.signIn
    [ class "bg-purple text-white text-opacity-90" ]
        """
    ]
        |> chunk Html.div
            [ "max-w-screen-md"
            , "px-8"
            , "py-10"
            ]
            []
        |> List.singleton
        |> chunk Html.div
            [ "font-body"
            , "text-base-800"

            -- Dark mode
            ------------
            , "dark:bg-base-900"
            , "dark:text-base-200"
            ]
            []
        |> List.singleton


component title pieces notes code =
    componentContainer
        []
        [ componentTitle title
        , componentNotes notes
        , componentPieces pieces

        --, chunk
        --    Html.code
        --    [ "bg-base-50"
        --    , "block"
        --    , "px-5"
        --    , "py-5"
        --    , "rounded-b"
        --    , "text-base-600"
        --    , "text-xs"
        --    ]
        --    []
        --    [ chunk
        --        Html.pre
        --        []
        --        []
        --        [ Html.text (String.trim code) ]
        --    ]
        ]


componentContainer =
    chunk
        Html.div
        [ "mb-8" ]


componentNotes =
    chunk
        Html.p
        [ "mb-6"
        , "mt-3"
        , "opacity-50"
        , "text-sm"
        ]
        []


componentPieces =
    chunk
        Html.div
        [ "bg-base-200"
        , "flex"
        , "items-center"
        , "justify-center"
        , "overflow-hidden"
        , "px-4"
        , "py-10"
        , "rounded-t"
        , "shadow"

        -- Dark mode
        ------------
        , "dark:bg-base-800"
        ]
        []


componentTitle title =
    chunk
        Html.h2
        [ "mb-3"
        , "text-xl"
        ]
        []
        [ Html.text title ]


lineBreak =
    Html.br [] []
