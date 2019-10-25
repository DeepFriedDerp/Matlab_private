function [aeroForces] = paramSpace_12_1_3_1_2_1_2(sailStates,airStates)

	CL = (4.701146)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.981935)*sailStates.p + (35.942146)*sailStates.q + (-0.685922)*sailStates.r + (0.010449)*sailStates.de;
	CD = -0.779390;
	CY = (-0.037012)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.545479)*sailStates.p + (0.696927)*sailStates.q + (0.076687)*sailStates.r + (0.000151)*sailStates.de;

	Cl = (1.727782)*sailStates.alpha + (0.244787)*sailStates.beta + (-1.590258)*sailStates.p + (12.829098)*sailStates.q + (-0.793208)*sailStates.r + (0.001057)*sailStates.de;
	Cm = (-15.341387)*sailStates.alpha + (-0.000000)*sailStates.beta + (10.993816)*sailStates.p + (-151.165665)*sailStates.q + (2.246051)*sailStates.r + (-0.070716)*sailStates.de;
	Cn = (-0.006301)*sailStates.alpha + (-0.034403)*sailStates.beta + (1.418443)*sailStates.p + (-7.751545)*sailStates.q + (-0.056508)*sailStates.r + (-0.000333)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end