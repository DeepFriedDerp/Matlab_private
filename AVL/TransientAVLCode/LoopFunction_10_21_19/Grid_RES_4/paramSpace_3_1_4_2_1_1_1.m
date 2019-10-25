function [aeroForces] = paramSpace_3_1_4_2_1_1_1(sailStates,airStates)

	CL = (4.154284)*sailStates.alpha + (-0.113938)*sailStates.beta + (-2.110548)*sailStates.p + (30.303566)*sailStates.q + (-0.518003)*sailStates.r + (0.010402)*sailStates.de;
	CD = -0.287120;
	CY = (-0.035909)*sailStates.alpha + (-0.025711)*sailStates.beta + (-0.271614)*sailStates.p + (-0.668511)*sailStates.q + (0.017732)*sailStates.r + (-0.000142)*sailStates.de;

	Cl = (1.071130)*sailStates.alpha + (0.126165)*sailStates.beta + (-0.905821)*sailStates.p + (6.963265)*sailStates.q + (-0.557770)*sailStates.r + (-0.000072)*sailStates.de;
	Cm = (-14.444418)*sailStates.alpha + (0.399140)*sailStates.beta + (7.478636)*sailStates.p + (-124.743294)*sailStates.q + (1.735460)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (-0.296798)*sailStates.alpha + (-0.011200)*sailStates.beta + (0.696699)*sailStates.p + (-2.955636)*sailStates.q + (-0.005333)*sailStates.r + (0.000121)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end