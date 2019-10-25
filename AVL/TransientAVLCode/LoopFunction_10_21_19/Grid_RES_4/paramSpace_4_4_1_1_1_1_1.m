function [aeroForces] = paramSpace_4_4_1_1_1_1_1(sailStates,airStates)

	CL = (4.732329)*sailStates.alpha + (0.335817)*sailStates.beta + (-1.390566)*sailStates.p + (20.019876)*sailStates.q + (-1.200207)*sailStates.r + (0.008678)*sailStates.de;
	CD = -1.647000;
	CY = (0.148758)*sailStates.alpha + (-0.021908)*sailStates.beta + (-0.673880)*sailStates.p + (-1.002334)*sailStates.q + (0.134151)*sailStates.r + (-0.000207)*sailStates.de;

	Cl = (0.265765)*sailStates.alpha + (0.462580)*sailStates.beta + (-0.323544)*sailStates.p + (0.489553)*sailStates.q + (-1.390415)*sailStates.r + (-0.001005)*sailStates.de;
	Cm = (-14.923399)*sailStates.alpha + (-1.419370)*sailStates.beta + (6.271430)*sailStates.p + (-107.565659)*sailStates.q + (3.936875)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (-1.413174)*sailStates.alpha + (-0.069659)*sailStates.beta + (1.586830)*sailStates.p + (-6.137781)*sailStates.q + (-0.026808)*sailStates.r + (0.000170)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end