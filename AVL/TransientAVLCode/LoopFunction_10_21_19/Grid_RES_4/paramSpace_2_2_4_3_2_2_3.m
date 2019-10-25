function [aeroForces] = paramSpace_2_2_4_3_2_2_3(sailStates,airStates)

	CL = (4.036731)*sailStates.alpha + (-0.013903)*sailStates.beta + (-2.827302)*sailStates.p + (37.052441)*sailStates.q + (-0.353900)*sailStates.r + (0.011216)*sailStates.de;
	CD = 0.032180;
	CY = (0.001302)*sailStates.alpha + (-0.024993)*sailStates.beta + (-0.063607)*sailStates.p + (0.065300)*sailStates.q + (-0.004162)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.371542)*sailStates.alpha + (0.021316)*sailStates.beta + (-1.437145)*sailStates.p + (11.960095)*sailStates.q + (-0.221325)*sailStates.r + (0.000733)*sailStates.de;
	Cm = (-14.664178)*sailStates.alpha + (0.020570)*sailStates.beta + (9.630601)*sailStates.p + (-144.341232)*sailStates.q + (1.164976)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (0.069293)*sailStates.alpha + (0.001769)*sailStates.beta + (0.075126)*sailStates.p + (-0.219117)*sailStates.q + (-0.003704)*sailStates.r + (-0.000047)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end