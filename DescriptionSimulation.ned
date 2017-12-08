//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import ned.DatarateChannel;


//
// TODO documentation
//
network Reseau
{
    @display("bgb=648,343");
    submodules:
        Host1: StandardHost {
            @display("p=19,104");
        }
        Host2: StandardHost {
            @display("p=25,269");
        }
        server: StandardHost {
            @display("p=578,184;i=device/server");
        }
        router: Router {
            @display("p=278,171");
        }
        configurator: IPv4NetworkConfigurator {
            @display("p=314,43");
        }
    connections:
        Host1.pppg++ <--> DatarateChannel <--> router.pppg++;
        Host2.pppg++ <--> DatarateChannel <--> router.pppg++;
        router.pppg++ <--> DatarateChannel {  datarate = 5Mbps; } <--> server.pppg++;
        server.pppg++ <--> DatarateChannel {  delay = 0.1ms; datarate = 50Mbps; } <--> router.pppg++;
        router.pppg++ <--> DatarateChannel {  delay = 0.1s; datarate = 10Mbps; } <--> Host1.pppg++;
        router.pppg++ <--> DatarateChannel {  delay = 0.1ms; datarate = 10Mbps; } <--> Host2.pppg++;
}

