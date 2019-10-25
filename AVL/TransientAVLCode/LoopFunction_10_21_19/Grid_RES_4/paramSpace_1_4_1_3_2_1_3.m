function [aeroForces] = paramSpace_1_4_1_3_2_1_3(sailStates,airStates)

	CL = (4.036293)*sailStates.alpha + (0.402555)*sailStates.beta + (-2.760709)*sailStates.p + (39.552437)*sailStates.q + (-1.754299)*sailStates.r + (0.010928)*sailStates.de;
	CD = -0.173340;
	CY = (-0.038358)*sailStates.alpha + (-0.024106)*sailStates.beta + (-0.575630)*sailStates.p + (0.194782)*sailStates.q + (-0.114521)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.306489)*sailStates.alpha + (0.392958)*sailStates.beta + (-1.328067)*sailStates.p + (11.837441)*sailStates.q + (-1.393872)*sailStates.r + (0.000530)*sailStates.de;
	Cm = (-12.220633)*sailStates.alpha + (-1.566976)*sailStates.beta + (8.471231)*sailStates.p + (-140.845245)*sailStates.q + (5.874564)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (0.218037)*sailStates.alpha + (0.055400)*sailStates.beta + (1.061346)*sailStates.p + (-3.953101)*sailStates.q + (-0.013868)*sailStates.r + (-0.000129)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end