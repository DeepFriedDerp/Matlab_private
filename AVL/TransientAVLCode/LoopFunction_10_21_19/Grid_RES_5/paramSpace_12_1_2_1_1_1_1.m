function [aeroForces] = paramSpace_12_1_2_1_1_1_1(sailStates,airStates)

	CL = (4.279086)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.937399)*sailStates.p + (27.815977)*sailStates.q + (-0.476340)*sailStates.r + (0.010028)*sailStates.de;
	CD = -0.505970;
	CY = (-0.010315)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.336603)*sailStates.p + (-0.696926)*sailStates.q + (0.047331)*sailStates.r + (-0.000148)*sailStates.de;

	Cl = (0.874196)*sailStates.alpha + (0.196258)*sailStates.beta + (-0.743085)*sailStates.p + (5.147023)*sailStates.q + (-0.638102)*sailStates.r + (-0.000363)*sailStates.de;
	Cm = (-14.977780)*sailStates.alpha + (0.000000)*sailStates.beta + (7.223768)*sailStates.p + (-121.395615)*sailStates.q + (1.591459)*sailStates.r + (-0.067712)*sailStates.de;
	Cn = (-0.489248)*sailStates.alpha + (-0.027582)*sailStates.beta + (0.859149)*sailStates.p + (-3.528169)*sailStates.q + (-0.016477)*sailStates.r + (0.000132)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end