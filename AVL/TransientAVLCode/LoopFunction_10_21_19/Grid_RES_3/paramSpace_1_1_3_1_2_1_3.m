function [aeroForces] = paramSpace_1_1_3_1_2_1_3(sailStates,airStates)

	CL = (6.155479)*sailStates.alpha + (-0.637577)*sailStates.beta + (-3.498708)*sailStates.p + (49.247841)*sailStates.q + (-3.412115)*sailStates.r + (0.012579)*sailStates.de;
	CD = -2.399930;
	CY = (-0.406063)*sailStates.alpha + (-0.026170)*sailStates.beta + (-1.307644)*sailStates.p + (0.589409)*sailStates.q + (-0.230517)*sailStates.r + (0.000127)*sailStates.de;

	Cl = (2.091965)*sailStates.alpha + (0.420876)*sailStates.beta + (-1.962597)*sailStates.p + (18.943007)*sailStates.q + (-2.912069)*sailStates.r + (0.001595)*sailStates.de;
	Cm = (-10.639606)*sailStates.alpha + (2.335170)*sailStates.beta + (9.762203)*sailStates.p + (-158.590912)*sailStates.q + (11.320191)*sailStates.r + (-0.070050)*sailStates.de;
	Cn = (1.872544)*sailStates.alpha + (0.114932)*sailStates.beta + (2.656576)*sailStates.p + (-11.223418)*sailStates.q + (0.015734)*sailStates.r + (-0.000462)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end