function [aeroForces] = paramSpace_1_2_1_1_2_1_3(sailStates,airStates)

	CL = (6.160096)*sailStates.alpha + (-0.270035)*sailStates.beta + (-3.500886)*sailStates.p + (50.552856)*sailStates.q + (-3.596331)*sailStates.r + (0.012542)*sailStates.de;
	CD = -2.451560;
	CY = (-0.424376)*sailStates.alpha + (-0.025749)*sailStates.beta + (-1.380957)*sailStates.p + (0.662185)*sailStates.q + (-0.274760)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (2.080812)*sailStates.alpha + (0.581243)*sailStates.beta + (-1.931530)*sailStates.p + (18.939852)*sailStates.q + (-3.086067)*sailStates.r + (0.001522)*sailStates.de;
	Cm = (-9.753276)*sailStates.alpha + (1.035825)*sailStates.beta + (9.433997)*sailStates.p + (-158.727341)*sailStates.q + (11.943041)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (1.951278)*sailStates.alpha + (0.133863)*sailStates.beta + (2.767194)*sailStates.p + (-11.359772)*sailStates.q + (0.012719)*sailStates.r + (-0.000445)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end