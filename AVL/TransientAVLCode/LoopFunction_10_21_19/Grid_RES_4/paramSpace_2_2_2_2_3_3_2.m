function [aeroForces] = paramSpace_2_2_2_2_3_3_2(sailStates,airStates)

	CL = (4.311563)*sailStates.alpha + (0.042447)*sailStates.beta + (-2.532464)*sailStates.p + (33.812111)*sailStates.q + (0.470286)*sailStates.r + (0.010781)*sailStates.de;
	CD = -0.305670;
	CY = (0.094360)*sailStates.alpha + (-0.025278)*sailStates.beta + (0.269355)*sailStates.p + (0.769436)*sailStates.q + (0.017627)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.264531)*sailStates.alpha + (-0.155388)*sailStates.beta + (-1.211151)*sailStates.p + (9.683513)*sailStates.q + (0.538244)*sailStates.r + (0.000370)*sailStates.de;
	Cm = (-14.893346)*sailStates.alpha + (-0.169334)*sailStates.beta + (8.890838)*sailStates.p + (-136.832825)*sailStates.q + (-1.594017)*sailStates.r + (-0.070027)*sailStates.de;
	Cn = (0.096617)*sailStates.alpha + (-0.011110)*sailStates.beta + (-0.703491)*sailStates.p + (2.912191)*sailStates.q + (-0.005603)*sailStates.r + (-0.000154)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end