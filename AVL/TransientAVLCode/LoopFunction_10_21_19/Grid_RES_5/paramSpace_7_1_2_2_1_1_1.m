function [aeroForces] = paramSpace_7_1_2_2_1_1_1(sailStates,airStates)

	CL = (4.163291)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.371859)*sailStates.p + (33.577106)*sailStates.q + (-0.596489)*sailStates.r + (0.011059)*sailStates.de;
	CD = -0.086220;
	CY = (-0.034673)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.231017)*sailStates.p + (-0.438541)*sailStates.q + (-0.008052)*sailStates.r + (-0.000094)*sailStates.de;

	Cl = (1.147628)*sailStates.alpha + (0.133260)*sailStates.beta + (-1.041640)*sailStates.p + (8.250084)*sailStates.q + (-0.536450)*sailStates.r + (0.000068)*sailStates.de;
	Cm = (-14.559534)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.059672)*sailStates.p + (-131.751755)*sailStates.q + (2.042353)*sailStates.r + (-0.069836)*sailStates.de;
	Cn = (-0.095053)*sailStates.alpha + (0.004654)*sailStates.beta + (0.495861)*sailStates.p + (-1.795306)*sailStates.q + (-0.000207)*sailStates.r + (0.000091)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end