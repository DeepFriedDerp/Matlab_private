function [aeroForces] = paramSpace_3_4_4_2_1_1_1(sailStates,airStates)

	CL = (4.154284)*sailStates.alpha + (0.113938)*sailStates.beta + (-2.110548)*sailStates.p + (30.303566)*sailStates.q + (-0.518002)*sailStates.r + (0.010402)*sailStates.de;
	CD = -0.287120;
	CY = (-0.035909)*sailStates.alpha + (-0.023861)*sailStates.beta + (-0.271614)*sailStates.p + (-0.668511)*sailStates.q + (0.017732)*sailStates.r + (-0.000142)*sailStates.de;

	Cl = (0.902316)*sailStates.alpha + (0.198371)*sailStates.beta + (-0.808133)*sailStates.p + (5.754704)*sailStates.q + (-0.564300)*sailStates.r + (-0.000329)*sailStates.de;
	Cm = (-14.444419)*sailStates.alpha + (-0.399140)*sailStates.beta + (7.478635)*sailStates.p + (-124.743294)*sailStates.q + (1.735461)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (-0.328422)*sailStates.alpha + (-0.010071)*sailStates.beta + (0.690296)*sailStates.p + (-2.876422)*sailStates.q + (-0.004905)*sailStates.r + (0.000121)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end