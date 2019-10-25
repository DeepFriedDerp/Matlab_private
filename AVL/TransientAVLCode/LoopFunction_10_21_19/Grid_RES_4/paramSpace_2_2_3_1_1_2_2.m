function [aeroForces] = paramSpace_2_2_3_1_1_2_2(sailStates,airStates)

	CL = (4.142828)*sailStates.alpha + (0.000834)*sailStates.beta + (-2.583829)*sailStates.p + (34.867199)*sailStates.q + (0.113221)*sailStates.r + (0.011059)*sailStates.de;
	CD = -0.014180;
	CY = (-0.208631)*sailStates.alpha + (-0.024432)*sailStates.beta + (0.205675)*sailStates.p + (-1.693497)*sailStates.q + (0.013421)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (1.350960)*sailStates.alpha + (-0.031862)*sailStates.beta + (-1.235033)*sailStates.p + (9.958578)*sailStates.q + (0.143585)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-15.000282)*sailStates.alpha + (-0.008438)*sailStates.beta + (8.952705)*sailStates.p + (-137.990799)*sailStates.q + (-0.371785)*sailStates.r + (-0.070145)*sailStates.de;
	Cn = (0.321711)*sailStates.alpha + (-0.003097)*sailStates.beta + (-0.472593)*sailStates.p + (3.589393)*sailStates.q + (-0.016203)*sailStates.r + (0.000517)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end