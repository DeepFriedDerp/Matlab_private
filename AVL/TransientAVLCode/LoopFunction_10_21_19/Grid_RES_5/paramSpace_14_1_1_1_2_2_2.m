function [aeroForces] = paramSpace_14_1_1_1_2_2_2(sailStates,airStates)

	CL = (4.335639)*sailStates.alpha + (0.000000)*sailStates.beta + (-3.093743)*sailStates.p + (44.191372)*sailStates.q + (2.304101)*sailStates.r + (0.011968)*sailStates.de;
	CD = -0.596330;
	CY = (0.235729)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.720357)*sailStates.p + (0.550482)*sailStates.q + (-0.153176)*sailStates.r + (0.000118)*sailStates.de;

	Cl = (1.273435)*sailStates.alpha + (-0.381995)*sailStates.beta + (-1.611130)*sailStates.p + (15.053877)*sailStates.q + (1.862799)*sailStates.r + (0.001055)*sailStates.de;
	Cm = (-11.296229)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.121054)*sailStates.p + (-149.810104)*sailStates.q + (-7.616666)*sailStates.r + (-0.069050)*sailStates.de;
	Cn = (-0.754462)*sailStates.alpha + (0.081195)*sailStates.beta + (-1.378401)*sailStates.p + (4.686579)*sailStates.q + (-0.030328)*sailStates.r + (0.000004)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end