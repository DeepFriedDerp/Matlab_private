function [aeroForces] = paramSpace_2_4_4_1_2_3_2(sailStates,airStates)

	CL = (6.215823)*sailStates.alpha + (-0.480906)*sailStates.beta + (-2.489508)*sailStates.p + (32.018982)*sailStates.q + (1.904019)*sailStates.r + (0.010387)*sailStates.de;
	CD = -2.243630;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.997237)*sailStates.p + (-0.000001)*sailStates.q + (0.065362)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.714973)*sailStates.alpha + (-0.619403)*sailStates.beta + (-1.131834)*sailStates.p + (8.404625)*sailStates.q + (1.890905)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-15.582025)*sailStates.alpha + (1.986269)*sailStates.beta + (9.188588)*sailStates.p + (-136.150452)*sailStates.q + (-6.485422)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.536133)*sailStates.alpha + (-0.028884)*sailStates.beta + (-2.286337)*sailStates.p + (10.458901)*sailStates.q + (-0.021432)*sailStates.r + (0.000175)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end