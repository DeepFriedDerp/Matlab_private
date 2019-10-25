function [aeroForces] = paramSpace_3_4_4_2_3_2_3(sailStates,airStates)

	CL = (3.884907)*sailStates.alpha + (-0.080855)*sailStates.beta + (-2.956650)*sailStates.p + (37.943871)*sailStates.q + (0.196752)*sailStates.r + (0.011029)*sailStates.de;
	CD = 0.041280;
	CY = (0.080728)*sailStates.alpha + (-0.025711)*sailStates.beta + (-0.010585)*sailStates.p + (0.668511)*sailStates.q + (0.000764)*sailStates.r + (0.000144)*sailStates.de;

	Cl = (1.280736)*sailStates.alpha + (-0.035729)*sailStates.beta + (-1.483178)*sailStates.p + (12.144390)*sailStates.q + (0.138827)*sailStates.r + (0.000756)*sailStates.de;
	Cm = (-14.106587)*sailStates.alpha + (0.386357)*sailStates.beta + (10.115656)*sailStates.p + (-147.557632)*sailStates.q + (-0.709082)*sailStates.r + (-0.070199)*sailStates.de;
	Cn = (-0.159121)*sailStates.alpha + (0.003329)*sailStates.beta + (0.106113)*sailStates.p + (-1.413639)*sailStates.q + (-0.010064)*sailStates.r + (-0.000219)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end