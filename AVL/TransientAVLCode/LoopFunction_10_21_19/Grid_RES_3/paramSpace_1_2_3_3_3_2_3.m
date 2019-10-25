function [aeroForces] = paramSpace_1_2_3_3_3_2_3(sailStates,airStates)

	CL = (3.995571)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.743601)*sailStates.p + (37.386440)*sailStates.q + (-1.085040)*sailStates.r + (0.010980)*sailStates.de;
	CD = 0.037460;
	CY = (0.054143)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.284888)*sailStates.p + (0.665001)*sailStates.q + (-0.050170)*sailStates.r + (0.000142)*sailStates.de;

	Cl = (1.361088)*sailStates.alpha + (0.115912)*sailStates.beta + (-1.374427)*sailStates.p + (11.887836)*sailStates.q + (-0.749963)*sailStates.r + (0.000642)*sailStates.de;
	Cm = (-14.117057)*sailStates.alpha + (0.000000)*sailStates.beta + (9.002053)*sailStates.p + (-141.960541)*sailStates.q + (3.607308)*sailStates.r + (-0.069034)*sailStates.de;
	Cn = (0.133395)*sailStates.alpha + (0.020438)*sailStates.beta + (0.429904)*sailStates.p + (-1.754800)*sailStates.q + (-0.014031)*sailStates.r + (-0.000245)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end