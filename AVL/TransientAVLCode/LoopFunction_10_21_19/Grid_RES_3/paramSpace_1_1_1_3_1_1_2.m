function [aeroForces] = paramSpace_1_1_1_3_1_1_2(sailStates,airStates)

	CL = (4.009868)*sailStates.alpha + (-0.307623)*sailStates.beta + (-2.542516)*sailStates.p + (37.062866)*sailStates.q + (-1.418826)*sailStates.r + (0.010914)*sailStates.de;
	CD = -0.124450;
	CY = (-0.064109)*sailStates.alpha + (-0.023471)*sailStates.beta + (-0.442175)*sailStates.p + (-0.491626)*sailStates.q + (-0.077921)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.247695)*sailStates.alpha + (0.155658)*sailStates.beta + (-1.230817)*sailStates.p + (10.878884)*sailStates.q + (-1.148136)*sailStates.r + (0.000474)*sailStates.de;
	Cm = (-12.635537)*sailStates.alpha + (1.215252)*sailStates.beta + (8.013516)*sailStates.p + (-135.234573)*sailStates.q + (4.781435)*sailStates.r + (-0.067514)*sailStates.de;
	Cn = (0.125604)*sailStates.alpha + (0.040134)*sailStates.beta + (0.819304)*sailStates.p + (-2.515676)*sailStates.q + (-0.020023)*sailStates.r + (0.000084)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end