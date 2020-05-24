module namespace page = 'http://artiigo.com';

declare
  %rest:POST
  %rest:path('/team/modify')
  %rest:form-param("id","{$id}","(noid)")
  %rest:form-param("name","{$name}","(noname)")
  %rest:form-param("num","{$num}","(nonum)")
  %rest:form-param("age","{$age}","(noage)")
  %rest:form-param("position","{$position}","(noposition)")
  %rest:form-param("country","{$country}","(nocountry)")
  %rest:form-param("height","{$height}","(noheight)")
  %rest:form-param("weight","{$weight}","(noweight)")
  %rest:form-param("birthdate","{$birthdate}","(nobirthdate)")
  %rest:form-param("foot","{$foot}","(nofoot)")
  %output:method('html')
  %output:doctype-system('about:legacy-compact')
updating function page:modifyPlayer(
    $id as xs:string,
    $name as xs:string,
    $num as xs:string,
    $age as xs:string,
    $position as xs:string,
    $country as xs:string,
    $height as xs:string,
    $weight as xs:string,
    $birthdate as xs:string,
    $foot as xs:string
) {
    update:output(web:redirect('/team')),
    for $player in doc("team")/team/players/player
    where $id = $player/id
    return replace node $player with
        <player>
            <id>{$id}</id>
            <name>{$name}</name>
            <number>{$num}</number>
            <age>{$age}</age>
            <position>{$position}</position>
            <country>{$country}</country>
            <height>{$height}</height>
            <weight>{$weight}</weight>
            <birthdate>{$birthdate}</birthdate>
            <foot>{$foot}</foot>
        </player>
};
