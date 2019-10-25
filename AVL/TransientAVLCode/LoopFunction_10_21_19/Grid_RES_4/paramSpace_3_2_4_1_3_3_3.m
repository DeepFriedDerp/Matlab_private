function [aeroForces] = paramSpace_3_2_4_1_3_3_3(sailStates,airStates)

	CL = (5.233377)*sailStates.alpha + (0.192376)*sailStates.beta + (-3.525881)*sailStates.p + (44.727764)*sailStates.q + (2.244694)*sailStates.r + (0.012003)*sailStates.de;
	CD = -1.856200;
	CY = (0.527063)*sailStates.alpha + (-0.024296)*sailStates.beta + (0.910532)*sailStates.p + (1.471503)*sailStates.q + (-0.059524)*sailStates.r + (0.000322)*sailStates.de;

	Cl = (1.274538)*sailStates.alpha + (-0.463572)*sailStates.beta + (-1.975793)*sailStates.p + (17.368572)*sailStates.q + (2.079413)*sailStates.r + (0.001614)*sailStates.de;
	Cm = (-11.277604)*sailStates.alpha + (-0.781924)*sailStates.beta + (11.404924)*sailStates.p + (-162.286758)*sailStates.q + (-7.663806)*sailStates.r + (-0.072841)*sailStates.de;
	Cn = (-1.433877)*sailStates.alpha + (0.033656)*sailStates.beta + (-1.956132)*sailStates.p + (7.204339)*sailStates.q + (-0.000204)*sailStates.r + (-0.000247)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end