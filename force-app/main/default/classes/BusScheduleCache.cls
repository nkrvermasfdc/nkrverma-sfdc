public class BusScheduleCache 
{ 
    private Cache.OrgPartition part;
    
    // Constructor
    public BusScheduleCache()
    {
        // Get partition to Part Variable
        Part = new Cache.OrgPartition('local.BusSchedule');        
		//Cache.OrgPartition Part = Cache.Org.getPartition('local.BusSchedule');
    }
    
    //Method 1 to put details
    public void putSchedule(String busLine, Time[] schedule)
    {
        if (Part!=null)
        {
            part.put('busLine', schedule);
        }
    }
    
    // Method 2 to retrive details
    public Time[] getSchedule(String busLine)
    {
        Time[] schedule = (Time[])Part.get(busLine);
        
        if  (schedule != null)
        {
            return schedule;
        }
        else
        {
            return new List<Time>{Time.newInstance(8,0,0,0), Time.newInstance(17,0,0,0)};
        }
        
    }
}