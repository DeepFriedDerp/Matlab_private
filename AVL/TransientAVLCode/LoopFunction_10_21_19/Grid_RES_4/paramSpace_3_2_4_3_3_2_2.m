function [aeroForces] = paramSpace_3_2_4_3_3_2_2(sailStates,airStates)

	CL = (4.022574)*sailStates.alpha + (0.028046)*sailStates.beta + (-2.571307)*sailStates.p + (34.966370)*sailStates.q + (0.216509)*sailStates.r + (0.010996)*sailStates.de;
	CD = 0.043810;
	CY = (0.062044)*sailStates.alpha + (-0.024746)*sailStates.beta + (0.017541)*sailStates.p + (0.498142)*sailStates.q + (-0.001097)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.271275)*sailStates.alpha + (-0.024079)*sailStates.beta + (-1.227300)*sailStates.p + (9.980977)*sailStates.q + (0.159435)*sailStates.r + (0.000399)*sailStates.de;
	Cm = (-14.607010)*sailStates.alpha + (-0.132717)*sailStates.beta + (8.808834)*sailStates.p + (-137.428818)*sailStates.q + (-0.772023)*sailStates.r + (-0.070088)*sailStates.de;
	Cn = (-0.129286)*sailStates.alpha + (0.001425)*sailStates.beta + (0.031463)*sailStates.p + (-0.882173)*sailStates.q + (-0.007592)*sailStates.r + (-0.000163)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end