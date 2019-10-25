function [aeroForces] = paramSpace_2_1_2_1_2_2_1(sailStates,airStates)

	CL = (4.448025)*sailStates.alpha + (0.271010)*sailStates.beta + (-2.108723)*sailStates.p + (33.817642)*sailStates.q + (1.572808)*sailStates.r + (0.011143)*sailStates.de;
	CD = -0.604990;
	CY = (0.038959)*sailStates.alpha + (-0.022990)*sailStates.beta + (0.568824)*sailStates.p + (1.226115)*sailStates.q + (-0.074800)*sailStates.r + (0.000260)*sailStates.de;

	Cl = (0.955430)*sailStates.alpha + (-0.266433)*sailStates.beta + (-0.840807)*sailStates.p + (7.105531)*sailStates.q + (1.367755)*sailStates.r + (-0.000190)*sailStates.de;
	Cm = (-12.248224)*sailStates.alpha + (-1.080913)*sailStates.beta + (6.499743)*sailStates.p + (-122.915756)*sailStates.q + (-5.321407)*sailStates.r + (-0.067524)*sailStates.de;
	Cn = (0.463353)*sailStates.alpha + (0.043542)*sailStates.beta + (-1.225016)*sailStates.p + (4.298114)*sailStates.q + (-0.004501)*sailStates.r + (-0.000265)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end