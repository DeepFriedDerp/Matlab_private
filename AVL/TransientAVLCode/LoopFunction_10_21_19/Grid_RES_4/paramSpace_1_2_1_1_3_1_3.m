function [aeroForces] = paramSpace_1_2_1_1_3_1_3(sailStates,airStates)

	CL = (7.549984)*sailStates.alpha + (-0.289832)*sailStates.beta + (-3.451802)*sailStates.p + (50.826908)*sailStates.q + (-4.022262)*sailStates.r + (0.012527)*sailStates.de;
	CD = -3.131910;
	CY = (-0.258151)*sailStates.alpha + (-0.027693)*sailStates.beta + (-1.645391)*sailStates.p + (2.326703)*sailStates.q + (-0.327539)*sailStates.r + (0.000500)*sailStates.de;

	Cl = (3.252400)*sailStates.alpha + (0.638005)*sailStates.beta + (-1.900963)*sailStates.p + (19.026581)*sailStates.q + (-3.435777)*sailStates.r + (0.001406)*sailStates.de;
	Cm = (-11.791903)*sailStates.alpha + (1.100962)*sailStates.beta + (8.864259)*sailStates.p + (-156.352325)*sailStates.q + (13.317855)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (1.995956)*sailStates.alpha + (0.149725)*sailStates.beta + (3.325112)*sailStates.p + (-15.147091)*sailStates.q + (0.053194)*sailStates.r + (-0.000962)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end