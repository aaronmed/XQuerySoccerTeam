module namespace page = 'http://artiigo.com';

declare
  %rest:POST
  %rest:path('/team/delete')
  %rest:form-param("num","{$num}","(nonum)")
  %output:method('html')
  %output:doctype-system('about:legacy-compact')
updating function page:deletePlayer(
    $num as xs:string
) {
    update:output(web:redirect('/team')),
    for $player in doc("team")/team/players/player
    where $num = $player/number
    return delete node $player
};
