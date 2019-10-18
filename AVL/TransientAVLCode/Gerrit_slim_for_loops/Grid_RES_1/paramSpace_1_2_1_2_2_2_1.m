function [aeroForces] = paramSpace_1_2_1_2_2_2_1(sailStates,airStates)

	CL = (7.735637)*sailStates.alpha + (-0.519729)*sailStates.beta + (-2.567389)*sailStates.p + (29.425175)*sailStates.q + (0.355601)*sailStates.r + (0.008679)*sailStates.de;
	CD = -4.916240;
	CY = (1.892024)*sailStates.alpha + (0.001633)*sailStates.beta + (-0.226841)*sailStates.p + (15.454384)*sailStates.q + (-0.027675)*sailStates.r + (0.003291)*sailStates.de;

	Cl = (-1.909465)*sailStates.alpha + (-0.524422)*sailStates.beta + (-1.367308)*sailStates.p + (11.233241)*sailStates.q + (0.998782)*sailStates.r + (0.000335)*sailStates.de;
	Cm = (-12.658814)*sailStates.alpha + (2.459603)*sailStates.beta + (9.289162)*sailStates.p + (-138.014847)*sailStates.q + (-1.424892)*sailStates.r + (-0.068395)*sailStates.de;
	Cn = (-1.970674)*sailStates.alpha + (-0.084289)*sailStates.beta + (-0.111094)*sailStates.p + (-10.530658)*sailStates.q + (0.136513)*sailStates.r + (-0.004364)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end