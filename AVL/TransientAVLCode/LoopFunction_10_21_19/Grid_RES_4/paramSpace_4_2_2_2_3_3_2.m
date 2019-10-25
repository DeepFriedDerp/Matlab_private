function [aeroForces] = paramSpace_4_2_2_2_3_3_2(sailStates,airStates)

	CL = (4.281218)*sailStates.alpha + (0.135591)*sailStates.beta + (-2.580038)*sailStates.p + (38.735531)*sailStates.q + (1.811228)*sailStates.r + (0.011397)*sailStates.de;
	CD = -0.363830;
	CY = (0.102040)*sailStates.alpha + (-0.024198)*sailStates.beta + (0.562951)*sailStates.p + (0.756271)*sailStates.q + (-0.112005)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.205099)*sailStates.alpha + (-0.271777)*sailStates.beta + (-1.217342)*sailStates.p + (11.015865)*sailStates.q + (1.458290)*sailStates.r + (0.000426)*sailStates.de;
	Cm = (-12.184209)*sailStates.alpha + (-0.498960)*sailStates.beta + (7.766633)*sailStates.p + (-135.926239)*sailStates.q + (-6.026248)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (-0.117012)*sailStates.alpha + (0.061276)*sailStates.beta + (-1.107272)*sailStates.p + (3.696492)*sailStates.q + (-0.021636)*sailStates.r + (-0.000113)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end