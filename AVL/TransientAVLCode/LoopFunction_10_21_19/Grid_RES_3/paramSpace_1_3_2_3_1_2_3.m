function [aeroForces] = paramSpace_1_3_2_3_1_2_3(sailStates,airStates)

	CL = (3.792048)*sailStates.alpha + (0.157736)*sailStates.beta + (-2.751662)*sailStates.p + (37.062206)*sailStates.q + (-0.838183)*sailStates.r + (0.010734)*sailStates.de;
	CD = 0.070970;
	CY = (-0.056023)*sailStates.alpha + (-0.025633)*sailStates.beta + (-0.146195)*sailStates.p + (-0.318253)*sailStates.q + (-0.025778)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.194621)*sailStates.alpha + (0.134360)*sailStates.beta + (-1.339849)*sailStates.p + (11.247582)*sailStates.q + (-0.562884)*sailStates.r + (0.000580)*sailStates.de;
	Cm = (-13.627532)*sailStates.alpha + (-0.570589)*sailStates.beta + (9.233378)*sailStates.p + (-142.287766)*sailStates.q + (2.832689)*sailStates.r + (-0.068238)*sailStates.de;
	Cn = (0.227800)*sailStates.alpha + (0.018957)*sailStates.beta + (0.135899)*sailStates.p + (0.370975)*sailStates.q + (-0.033631)*sailStates.r + (0.000075)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end