function [aeroForces] = paramSpace_11_1_3_1_1_1_1(sailStates,airStates)

	CL = (4.313827)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.976377)*sailStates.p + (28.566454)*sailStates.q + (-0.601887)*sailStates.r + (0.010233)*sailStates.de;
	CD = -0.505980;
	CY = (-0.017401)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.351701)*sailStates.p + (-0.768920)*sailStates.q + (0.036938)*sailStates.r + (-0.000164)*sailStates.de;

	Cl = (0.894248)*sailStates.alpha + (0.206824)*sailStates.beta + (-0.759413)*sailStates.p + (5.328417)*sailStates.q + (-0.703202)*sailStates.r + (-0.000355)*sailStates.de;
	Cm = (-14.779958)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.243002)*sailStates.p + (-122.164581)*sailStates.q + (2.021368)*sailStates.r + (-0.068317)*sailStates.de;
	Cn = (-0.485953)*sailStates.alpha + (-0.021738)*sailStates.beta + (0.884831)*sailStates.p + (-3.643612)*sailStates.q + (-0.010670)*sailStates.r + (0.000145)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end