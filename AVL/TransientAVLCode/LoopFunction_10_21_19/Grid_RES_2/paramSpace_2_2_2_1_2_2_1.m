function [aeroForces] = paramSpace_2_2_2_1_2_2_1(sailStates,airStates)

	CL = (4.448024)*sailStates.alpha + (-0.271010)*sailStates.beta + (-2.108723)*sailStates.p + (33.817646)*sailStates.q + (1.572808)*sailStates.r + (0.011143)*sailStates.de;
	CD = -0.604990;
	CY = (0.038959)*sailStates.alpha + (-0.026820)*sailStates.beta + (0.568824)*sailStates.p + (1.226115)*sailStates.q + (-0.074800)*sailStates.r + (0.000260)*sailStates.de;

	Cl = (0.851598)*sailStates.alpha + (-0.397066)*sailStates.beta + (-0.776416)*sailStates.p + (6.303731)*sailStates.q + (1.359221)*sailStates.r + (-0.000361)*sailStates.de;
	Cm = (-12.248224)*sailStates.alpha + (1.080913)*sailStates.beta + (6.499743)*sailStates.p + (-122.915771)*sailStates.q + (-5.321409)*sailStates.r + (-0.067524)*sailStates.de;
	Cn = (0.536189)*sailStates.alpha + (0.043810)*sailStates.beta + (-1.233493)*sailStates.p + (4.403673)*sailStates.q + (-0.003378)*sailStates.r + (-0.000265)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end