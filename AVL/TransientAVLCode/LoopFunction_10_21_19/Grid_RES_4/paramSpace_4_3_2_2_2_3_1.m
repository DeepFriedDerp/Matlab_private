function [aeroForces] = paramSpace_4_3_2_2_2_3_1(sailStates,airStates)

	CL = (4.487515)*sailStates.alpha + (-0.137460)*sailStates.beta + (-2.170226)*sailStates.p + (35.557632)*sailStates.q + (1.849262)*sailStates.r + (0.011204)*sailStates.de;
	CD = -0.483140;
	CY = (-0.068745)*sailStates.alpha + (-0.025286)*sailStates.beta + (0.635350)*sailStates.p + (0.301042)*sailStates.q + (-0.126390)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.147835)*sailStates.alpha + (-0.367750)*sailStates.beta + (-0.853862)*sailStates.p + (7.595505)*sailStates.q + (1.483515)*sailStates.r + (-0.000219)*sailStates.de;
	Cm = (-12.146915)*sailStates.alpha + (0.504740)*sailStates.beta + (6.256056)*sailStates.p + (-123.990753)*sailStates.q + (-6.135322)*sailStates.r + (-0.066646)*sailStates.de;
	Cn = (0.510145)*sailStates.alpha + (0.064779)*sailStates.beta + (-1.330612)*sailStates.p + (5.417288)*sailStates.q + (0.003366)*sailStates.r + (0.000017)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end