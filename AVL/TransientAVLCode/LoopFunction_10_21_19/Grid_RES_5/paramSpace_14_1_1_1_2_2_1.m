function [aeroForces] = paramSpace_14_1_1_1_2_2_1(sailStates,airStates)

	CL = (4.445780)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.115838)*sailStates.p + (35.794930)*sailStates.q + (1.885470)*sailStates.r + (0.011463)*sailStates.de;
	CD = -0.585420;
	CY = (0.055943)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.591711)*sailStates.p + (1.364606)*sailStates.q + (-0.125919)*sailStates.r + (0.000286)*sailStates.de;

	Cl = (0.894932)*sailStates.alpha + (-0.349936)*sailStates.beta + (-0.808021)*sailStates.p + (7.276320)*sailStates.q + (1.519405)*sailStates.r + (-0.000242)*sailStates.de;
	Cm = (-11.351919)*sailStates.alpha + (-0.000000)*sailStates.beta + (5.978503)*sailStates.p + (-122.335159)*sailStates.q + (-6.233442)*sailStates.r + (-0.066282)*sailStates.de;
	Cn = (0.473409)*sailStates.alpha + (0.074381)*sailStates.beta + (-1.279714)*sailStates.p + (4.473557)*sailStates.q + (-0.014452)*sailStates.r + (-0.000278)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end