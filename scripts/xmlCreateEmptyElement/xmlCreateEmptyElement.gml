//element = xmlCreateEmptyElement(Name,extra_info,parentElement)
//used by core
//creates an empty element
with(instance_create(0,0,ElementObj))
{
    m_Name = argument0;
    //m_Extra = argument1; 
    xmlEtrasToProperties(argument1);
    m_Parent = argument2;
    return id;
}
