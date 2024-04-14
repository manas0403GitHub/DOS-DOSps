Write-Host "||=======|	||==============|| ||========||
||        |     ||		|| ||	     
||	   |    ||		|| ||	     
||	    |   ||		|| ||========||
||	    |   ||		||	     ||
||	    |   ||		||           ||
||	   |    ||		||	     ||
||        |     ||		||
||=======|      ||==============||  ===========
---------------------------------------------------
||=======|	||==============|| ||========||
||        |     ||		|| ||	     
||	   |    ||		|| ||	     
||	    |   ||		|| ||========||
||	    |   ||		||	     ||
||	    |   ||		||           ||
||	   |    ||		||	     ||
||        |     ||		||
||=======|      ||==============||  ==========="

$game = Read-Host -Prompt "Choose a game to play,
HANG(Hangman) or RIDD(Riddler)"
if ($game -eq "HANG"){
    Clear-Host
    function hangman_levels{
        param (
            $level = 0
        )  
        if ($level -eq 0) {
         Write-Host "     __________________________________
         |	    //	:
         |      //	:
         |     //	:
         |    //	      
         |   //        	       
         |  //	      
         | //  	              
         |//	     
         |/	      
         |	       
         |		
         |	       
         |	      
         |	     
         |
         |
         |
         |================================
         |================================
         "
        } elseif ($level -eq 1) {
         Write-Host "     __________________________________
         |	    //	:
         |      //	:
         |     //	:
         |    //    ____
         |   //    /    \	       
         |  //     |    |  
         | //      \____/	         
         |//	     
         |/	      
         |	       
         |		
         |	       
         |	      
         |	     
         |
         |
         |
         |================================
         |================================
         "
        } elseif ($level -eq 2){
         Write-Host "     __________________________________
         |	    //	:
         |      //	:
         |     //	:
         |    //    ____
         |   //    /    \	       
         |  //     |    |  
         | //      \____/	         
         |//	        || 
         |/	        ||
         |	        ||
         |		
         |	       
         |	      
         |	    
         |
         |
         |
         |================================
         |================================
         "
        } elseif ($level -eq 3) {
         Write-Host "     __________________________________
         |	    //	:
         |      //	:
         |     //	:
         |    //    ____
         |   //    /    \	       
         |  //     |    |  
         | //      \____/	         
         |//	     \\ || //
         |/	      \\||//
         |	       \||/
         |		
         |	       
         |	      
         |	     
         |
         |
         |
         |================================
         |================================
         "
        } elseif ($level -eq 4) {
         Write-Host "     __________________________________
         |	    //	:
         |      //	:
         |     //	:
         |    //    ____
         |   //    /    \	       
         |  //     |    |  
         | //      \____/	         
         |//	     \\ || //
         |/	      \\||//
         |	       \||/
         |           ||
         |	       //
         |	      // 
         |	     //    
         |
         |
         |
         |================================
         |================================
         "
        } elseif ($level -eq 5) {
         Write-Host "     __________________________________
         |	    //	:
         |      //	:
         |     //	:
         |    //    ____
         |   //    /    \	       
         |  //     |    |  
         | //      \____/	         
         |//	     \\ || //
         |/	      \\||//
         |	       \||/
         |           ||
         |	       //\\
         |	      //  \\
         |	     //    \\
         |
         |
         |
         |================================
         |================================
         "
        }
     }
     
     function hangman_start {
         Write-Host "
     ||     ||
     ||     ||          
     ||=====|| ||====||   ||====|| ||=====||	||===||===|| ||====||   ||====||
     ||     || ||	||   ||	   || ||     || ||   ||   || ||	   ||   ||    ||
     ||     || ||====||== ||	   || ||=====|| ||   ||   || ||====||== ||    ||
                          || 
                          ||
                       =======||
      "
     }
     
     function hangman_loop{
         hangman_start
         $lifes = 0
         $correctLetters = @()
         hangman_levels $lifes
     
         $words = @(
         "abandon",
         "analyze",
         "beneath",
         "bewilder",
         "caution",
         "cohesive",
         "deter",
         "discern",
         "elicit",
         "equilibrium",
         "serene",
         "fathom",
         "frenzy",
         "hazard",
         "imminent",
         "integrate",
         "jovial",
         "linger",
         "nourish",
         "obscure",
         "plethora",
         "quench",
         "ravage",
         "scrutinize",
         "sustain",
         "tangible",
         "uphold",
         "vulnerable",
         "whimsical",
         "yearn"
         )
     
         $randomWord = $words | Get-Random
     
         $slicedWord = $randomWord.ToCharArray()
     
         while ($true) {
     
             $length = $randomWord.Length
             Write-Host "There are $length Letters"
     
             $guessletter = Read-Host -Prompt "Enter a letter"
     
             if ($guessletter -in $slicedWord) {
                 Write-Host "You got it!"
                 Start-Sleep -Seconds 1
                 Clear-Host
     
                 hangman_levels $lifes
     
                 $correctLetters += $guessletter
                 Write-Host $correctLetters
         
             } else {
                 Write-Host "Nope, try again."
                 Start-Sleep -Seconds 1
                 Clear-Host
     
                 $lifes += 1
                 hangman_levels $lifes
     
             }
     
             if ($null -eq (Compare-Object $correctLetters $slicedWord)){
                 Write-Host "Congrats! You got the word!"
                 Write-Host "It is $randomWord!"
                 $again = Read-Host -Prompt "Again?Y/N"
                 if ($again -eq "Y") {
                     Start-Sleep -Seconds 1\
                     Clear-Host
     
                     $randomWord = $words | Get-Random
     
                     $slicedWord = $randomWord.ToCharArray()
     
                     $lifes = 0
                     hangman_levels $lifes
                     
                     $correctLetters = @()
                 } else {
                     Stop-Job
                 }
             } 
             if($lifes -eq 5) {
                 Write-Host "You Lose!"
                 Write-Host "The word is $randomWord"
                 $again = Read-Host -Prompt "Again?Y/N"
                 if ($again -eq "Y") {
                     Start-Sleep -Seconds 1\
                     Clear-Host
     
                     $randomWord = $words | Get-Random
     
                     $slicedWord = $randomWord.ToCharArray()
     
                     $lifes = 0
                     hangman_levels $lifes
     
                     $correctLetters = @()
     
                 } else {
                     Stop-Job
                 }
             }
         }
     }
     hangman_loop
} elseif ($game -eq "RIDD"){
        Clear-Host
        $riddles = @(
    "1.What goes up but never comes down?"
    "2.What has hands but cannot move?"
    "3.What has legs but cannot move?"
    "4.What has countries, states, cities and towns but, no people?"
    "5.What has 1 foot 1 head and 4 legs?"
    "6.What can a child make but never see?"
    "7.Which key is hardest to turn?"
    "8.What has 13 hearts?"
    "9.What was Red is Black?"
    "10.What has 4 fingers and a thumb?"
    "11.What is Black,White and Red?"
    "12.What loses its head every morning, but gets it back at night?" 
    "13.The more there is the less you see..."
    "14.What has a head but no neck?"
    "15.What occurs once a minute, twice every millennium, but never in a hundred years(Enter just the letter)?"
    )
    $answers = @(
        "Balloon"
        "Clock"
        "Chair"
        "Map"
        "Bed"
        "Noise"
        "Donkey"
        "Deck of playing cards"
        "Matchstick"
        "Glove"
        "Charcoal"
        "Pillow"
        "Darkness"
        "Bottle"
        "M"
    )

    $quesID = 0
    $Score = 0

    Write-Host "
    ||========||		||	   || ||
    ||	  ||		||         || ||
    ||	  || {}		||         || ||
    ||========||		|| 	   || || ||====|| ||======
    ||\\	     || ||======|| ||======|| || ||    || ||
    || \\	     ||	||	|| ||	   || || ||====|| ||
    ||  \\	     || ||	|| ||	   || || ||	  ||
    ||   \\      ||	||======|| ||======|| || ||====|| ||"
    foreach ($question in $riddles){
        if ($answers[$quesID-1] -eq $riddle){
            Write-Host "Correct!"
            $Score += 1
        } elseif (-not $answers[$quesID-1] -eq $riddle -and $quesID -gt 0)  {
            Write-Host "Wrong!"
        }
        $riddle = Read-Host -Prompt $question
        $quesID += 1
    }
    Write-Host ("$Score/15")
}
