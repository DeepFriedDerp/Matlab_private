function [aeroForces] = paramSpace_1_3_3_1_2_3_2(sailStates,airStates)

	CL = (5.862026)*sailStates.alpha + (-0.325735)*sailStates.beta + (-2.334679)*sailStates.p + (27.886168)*sailStates.q + (1.381568)*sailStates.r + (0.009313)*sailStates.de;
	CD = -2.078290;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (0.858610)*sailStates.p + (-0.000000)*sailStates.q + (0.151396)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.591913)*sailStates.alpha + (-0.508259)*sailStates.beta + (-1.076776)*sailStates.p + (7.424097)*sailStates.q + (1.524653)*sailStates.r + (0.000217)*sailStates.de;
	Cm = (-16.692255)*sailStates.alpha + (1.356424)*sailStates.beta + (9.582350)*sailStates.p + (-134.612778)*sailStates.q + (-4.553989)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.624448)*sailStates.alpha + (-0.065430)*sailStates.beta + (-2.099910)*sailStates.p + (9.888074)*sailStates.q + (-0.068273)*sailStates.r + (0.000161)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end