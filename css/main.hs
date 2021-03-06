{-# LANGUAGE OverloadedStrings #-}
import           Clay
import           Clay.Pseudo
import qualified Data.Text.Lazy.IO as T
import           Data.Monoid
import           Control.Monad

mylastChild :: Refinement
mylastChild = ":last-child"

main :: IO ()
main = T.putStr $ renderWith compact [] $ do
    let basetextcolor = color "#404040"
        secondcolor = color "#555555"
    a ? do
        color "#43557F"
    (img <> object <> embed) ? do
        maxWidth $ pct 100
    body ? do
        backgroundColor "#F7F7F7"
        basetextcolor
        backgroundImage $ url "/images/dots.svg"
        fontSize $ pct 100
        "line-height" -: "1.25"
        padding nil nil nil nil
        margin nil nil nil nil
    "#bodyWrap" ? do
        maxWidth $ em 40
        sym2 margin nil auto
        -- backgroundColor white
        boxShadow nil (px 1) (px 6) (rgba 0 0 0 15)
    "#header" ? do
        borderBottom solid (px 2) black
        sym2 padding (px 12) nil
        marginBottom $ px 30
        "#navigation" ? do
            textAlign $ alignSide sideRight
            a ? do
                basetextcolor
                fontSize $ px 18
                fontWeight bold
                marginLeft $ px 12
                textDecoration none
                textTransform uppercase
    "#content" ? do
        fontFamily ["Libre Baskerville"] [serif]
    "#logo" ? a ? do
        basetextcolor
        float floatLeft
        fontSize $ px 18
        fontWeight bold
        textDecoration none
    "#footer" ? do
        borderTop solid (px 2) black
        secondcolor
        fontSize $ px 12
        marginTop $ px 30
        sym2 padding (px 12) nil
        textAlign $ alignSide sideRight
    ".info" ? do
        secondcolor
        fontSize $ px 14
        fontStyle italic
    (h1 <> h2 <> h3 <> h4 <> h5) ? do
        marginTop nil
        marginBottom nil
        marginLeft $ px 14
        color "#222A40"
    (p
        <> "#footer"
        <> "#header"
        <> ".info"
        ) ? do
        paddingLeft $ em 1
        paddingRight $ em 1
    let modular = [(h1, 2.625, 1.27976), (h2, 2, 1.25), (h3, 1.5, 1.45833)]
    forM_ modular $ \(tag, size, pad) -> tag ? do
        fontSize $ em size
        paddingTop $ em pad
        paddingBottom $ em pad
    blockquote ? do
        padding (em 2) (em 2) (em 1) (em 3)
        textAlign $ alignSide sideRight
        backgroundColor $ "#D82545"
        color white
        margin nil nil nil nil
        fontSize (pct 125)
        (a <> h1 <> h2 <> h3 <> h4 <> h5) ? do
            color white
    ".figure" ? do
        textAlign $ alignSide sideCenter
    figure ? do
        marginLeft nil
        marginRight nil
    figcaption ? do
        textAlign $ alignSide sideCenter
    let defSpace = 8
    dl ? do -- Definition List
        backgroundColor "#68A8C3"
        color white
        paddingTop $ em 1
        paddingBottom $ em 1
        a ? do
          color "#EBF8FF"
        dt ? do -- Definition Term
            color "#EBF8FF"
            float floatLeft
            fontWeight bold
            width $ em defSpace
            clear clearLeft
            textAlign $ alignSide sideRight
        dd ? do -- Definition Description
            marginLeft $ em $ 1 + defSpace
            marginBottom $ em 1
            marginRight $ em 3
            paddingLeft $ em 0.5
            borderLeft dashed (px 1) white
            p ? do
                marginLeft nil
                paddingLeft nil
                marginTop nil
                marginBottom nil
                paddingBottom nil
        dd # mylastChild ? do
            marginBottom nil
