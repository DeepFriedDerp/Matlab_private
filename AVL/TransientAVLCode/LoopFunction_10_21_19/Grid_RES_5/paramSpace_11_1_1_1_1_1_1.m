function [aeroForces] = paramSpace_11_1_1_1_1_1_1(sailStates,airStates)

	CL = (4.380083)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.976988)*sailStates.p + (28.514067)*sailStates.q + (-0.617543)*sailStates.r + (0.010328)*sailStates.de;
	CD = -0.543840;
	CY = (-0.011104)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.381176)*sailStates.p + (-0.768921)*sailStates.q + (0.040145)*sailStates.r + (-0.000164)*sailStates.de;

	Cl = (0.886102)*sailStates.alpha + (0.221567)*sailStates.beta + (-0.759751)*sailStates.p + (5.325971)*sailStates.q + (-0.750099)*sailStates.r + (-0.000355)*sailStates.de;
	Cm = (-14.989968)*sailStates.alpha + (0.000000)*sailStates.beta + (7.252469)*sailStates.p + (-122.164581)*sailStates.q + (2.111435)*sailStates.r + (-0.068317)*sailStates.de;
	Cn = (-0.502502)*sailStates.alpha + (-0.023288)*sailStates.beta + (0.928504)*sailStates.p + (-3.666887)*sailStates.q + (-0.010813)*sailStates.r + (0.000157)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end