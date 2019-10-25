function [aeroForces] = paramSpace_1_3_2_1_2_3_2(sailStates,airStates)

	CL = (5.784748)*sailStates.alpha + (-0.301598)*sailStates.beta + (-2.333866)*sailStates.p + (27.943756)*sailStates.q + (1.370407)*sailStates.r + (0.009209)*sailStates.de;
	CD = -2.032990;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (0.839279)*sailStates.p + (0.000001)*sailStates.q + (0.147987)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.589630)*sailStates.alpha + (-0.498045)*sailStates.beta + (-1.076358)*sailStates.p + (7.426733)*sailStates.q + (1.493359)*sailStates.r + (0.000217)*sailStates.de;
	Cm = (-16.454384)*sailStates.alpha + (1.198745)*sailStates.beta + (9.570830)*sailStates.p + (-134.612778)*sailStates.q + (-4.488660)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.624345)*sailStates.alpha + (-0.063525)*sailStates.beta + (-2.070966)*sailStates.p + (9.873123)*sailStates.q + (-0.068382)*sailStates.r + (0.000174)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end