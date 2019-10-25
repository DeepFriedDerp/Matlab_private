function [aeroForces] = paramSpace_2_2_1_1_3_2_3(sailStates,airStates)

	CL = (3.919562)*sailStates.alpha + (-0.060103)*sailStates.beta + (-3.433829)*sailStates.p + (42.255573)*sailStates.q + (-0.907091)*sailStates.r + (0.011450)*sailStates.de;
	CD = -0.031270;
	CY = (0.094002)*sailStates.alpha + (-0.025862)*sailStates.beta + (-0.408085)*sailStates.p + (1.915493)*sailStates.q + (-0.026950)*sailStates.r + (0.000419)*sailStates.de;

	Cl = (1.606959)*sailStates.alpha + (0.105003)*sailStates.beta + (-1.936237)*sailStates.p + (16.725645)*sailStates.q + (-0.723060)*sailStates.r + (0.001535)*sailStates.de;
	Cm = (-13.811443)*sailStates.alpha + (0.242427)*sailStates.beta + (11.509821)*sailStates.p + (-160.694275)*sailStates.q + (3.084497)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (0.263051)*sailStates.alpha + (0.009162)*sailStates.beta + (0.722889)*sailStates.p + (-4.097831)*sailStates.q + (0.008319)*sailStates.r + (-0.000596)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end