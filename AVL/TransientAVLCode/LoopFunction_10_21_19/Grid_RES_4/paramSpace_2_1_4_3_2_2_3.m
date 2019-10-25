function [aeroForces] = paramSpace_2_1_4_3_2_2_3(sailStates,airStates)

	CL = (3.975051)*sailStates.alpha + (-0.041322)*sailStates.beta + (-2.807766)*sailStates.p + (36.786491)*sailStates.q + (-0.351462)*sailStates.r + (0.011047)*sailStates.de;
	CD = 0.032080;
	CY = (0.001284)*sailStates.alpha + (-0.024835)*sailStates.beta + (-0.063202)*sailStates.p + (0.065300)*sailStates.q + (-0.004136)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.397574)*sailStates.alpha + (0.005169)*sailStates.beta + (-1.460476)*sailStates.p + (12.287969)*sailStates.q + (-0.221948)*sailStates.r + (0.000811)*sailStates.de;
	Cm = (-14.440126)*sailStates.alpha + (0.061199)*sailStates.beta + (9.563920)*sailStates.p + (-143.297119)*sailStates.q + (1.156951)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (0.074037)*sailStates.alpha + (0.001443)*sailStates.beta + (0.072471)*sailStates.p + (-0.191111)*sailStates.q + (-0.003816)*sailStates.r + (-0.000047)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end