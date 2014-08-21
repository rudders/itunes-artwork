###

###
command: "osascript itunes-artwork/iTunesartwork.widget/iTunes.scpt"

refreshFrequency: 5000

style: """
  top: 50%
  left: 50px
  color: #fff
  font-family: Helvetica Neue
  transform translate(0,-50%)
  width 200px
  text-align center

  p
    padding: 0
    margin: 0
    font-size 12px
    opacity 0.2

  img
  	width 200px
"""

render: (output) -> """
	<div class="artwork"></div>
	<div class="track"></div>
"""

update: (output, domEl) ->
	if  output.search("PQPQPQPQ") # if this returns 0 we have a track
		if $(domEl).find('.track').html() != output.substr(0, output.length-4) # has tracked changed?
			$(domEl).find('.track').html output.substr(0, output.length-4)
			type = output.substr((output.length-4),3)
			if type == "XXX"
				IMG =  "<img src=\"itunes-artwork/iTunesartwork.widget/unknown.png\" style=\"opacity:0.5\"/>"
			else
				IMG =  "<img src=\"itunes-artwork/iTunesartwork.widget/cover." + type + "\" style=\"opacity:0.5; border:1px solid white;\"/>"
			$(domEl).find('.artwork').html(IMG)
	else
		$(domEl).find('.track').html ""	
		$(domEl).find('.artwork').html ""		
	