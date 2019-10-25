function [aeroForces] = paramSpace_10_1_1_1_2_2_2(sailStates,airStates)

	CL = (4.457085)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.124187)*sailStates.p + (40.694675)*sailStates.q + (1.439759)*sailStates.r + (0.011697)*sailStates.de;
	CD = -0.576620;
	CY = (0.220095)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.527621)*sailStates.p + (0.839975)*sailStates.q + (-0.036984)*sailStates.r + (0.000183)*sailStates.de;

	Cl = (1.363903)*sailStates.alpha + (-0.297754)*sailStates.beta + (-1.643062)*sailStates.p + (14.079166)*sailStates.q + (1.256564)*sailStates.r + (0.001048)*sailStates.de;
	Cm = (-13.407051)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.278103)*sailStates.p + (-151.784744)*sailStates.q + (-4.853486)*sailStates.r + (-0.071706)*sailStates.de;
	Cn = (-0.478150)*sailStates.alpha + (0.020821)*sailStates.beta + (-1.126681)*sailStates.p + (4.249632)*sailStates.q + (-0.001151)*sailStates.r + (-0.000108)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end