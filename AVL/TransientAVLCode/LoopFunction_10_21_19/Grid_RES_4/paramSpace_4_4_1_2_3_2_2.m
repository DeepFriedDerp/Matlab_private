function [aeroForces] = paramSpace_4_4_1_2_3_2_2(sailStates,airStates)

	CL = (3.815042)*sailStates.alpha + (-0.146131)*sailStates.beta + (-2.484690)*sailStates.p + (34.816593)*sailStates.q + (0.772434)*sailStates.r + (0.010608)*sailStates.de;
	CD = 0.065160;
	CY = (0.093564)*sailStates.alpha + (-0.026957)*sailStates.beta + (0.078257)*sailStates.p + (0.756270)*sailStates.q + (-0.015648)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.075157)*sailStates.alpha + (-0.116528)*sailStates.beta + (-1.121453)*sailStates.p + (9.194756)*sailStates.q + (0.468895)*sailStates.r + (0.000250)*sailStates.de;
	Cm = (-13.838952)*sailStates.alpha + (0.448884)*sailStates.beta + (8.382875)*sailStates.p + (-134.899979)*sailStates.q + (-2.590290)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (-0.216686)*sailStates.alpha + (0.019329)*sailStates.beta + (-0.029515)*sailStates.p + (-0.943557)*sailStates.q + (-0.043197)*sailStates.r + (-0.000192)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end