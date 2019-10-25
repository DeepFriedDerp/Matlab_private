function [aeroForces] = paramSpace_1_3_3_2_2_3_1(sailStates,airStates)

	CL = (4.184007)*sailStates.alpha + (-0.089672)*sailStates.beta + (-2.026623)*sailStates.p + (28.448130)*sailStates.q + (0.294511)*sailStates.r + (0.009895)*sailStates.de;
	CD = -0.370600;
	CY = (-0.088664)*sailStates.alpha + (-0.025440)*sailStates.beta + (0.335584)*sailStates.p + (-0.267957)*sailStates.q + (0.059147)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (0.963115)*sailStates.alpha + (-0.177919)*sailStates.beta + (-0.782477)*sailStates.p + (5.382048)*sailStates.q + (0.499157)*sailStates.r + (-0.000292)*sailStates.de;
	Cm = (-15.166638)*sailStates.alpha + (0.438455)*sailStates.beta + (7.593393)*sailStates.p + (-123.711845)*sailStates.q + (-0.954475)*sailStates.r + (-0.066408)*sailStates.de;
	Cn = (0.530833)*sailStates.alpha + (-0.022443)*sailStates.beta + (-0.849080)*sailStates.p + (4.188096)*sailStates.q + (-0.037600)*sailStates.r + (0.000133)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end