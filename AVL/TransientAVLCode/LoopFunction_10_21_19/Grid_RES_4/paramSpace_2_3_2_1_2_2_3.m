function [aeroForces] = paramSpace_2_3_2_1_2_2_3(sailStates,airStates)

	CL = (3.705720)*sailStates.alpha + (0.032285)*sailStates.beta + (-3.451195)*sailStates.p + (42.145233)*sailStates.q + (-0.454712)*sailStates.r + (0.011486)*sailStates.de;
	CD = 0.035330;
	CY = (-0.015922)*sailStates.alpha + (-0.024889)*sailStates.beta + (-0.119107)*sailStates.p + (0.221995)*sailStates.q + (-0.007814)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (1.361871)*sailStates.alpha + (0.061613)*sailStates.beta + (-1.914347)*sailStates.p + (16.291439)*sailStates.q + (-0.334824)*sailStates.r + (0.001486)*sailStates.de;
	Cm = (-13.451544)*sailStates.alpha + (-0.125846)*sailStates.beta + (11.708097)*sailStates.p + (-161.490479)*sailStates.q + (1.548868)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (0.183374)*sailStates.alpha + (0.003482)*sailStates.beta + (0.140336)*sailStates.p + (-0.310317)*sailStates.q + (-0.004543)*sailStates.r + (-0.000073)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end