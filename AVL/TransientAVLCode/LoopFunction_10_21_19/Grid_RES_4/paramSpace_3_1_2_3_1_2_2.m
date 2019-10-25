function [aeroForces] = paramSpace_3_1_2_3_1_2_2(sailStates,airStates)

	CL = (4.031605)*sailStates.alpha + (0.076435)*sailStates.beta + (-2.542234)*sailStates.p + (34.722145)*sailStates.q + (0.456768)*sailStates.r + (0.010888)*sailStates.de;
	CD = 0.019450;
	CY = (-0.062140)*sailStates.alpha + (-0.025265)*sailStates.beta + (0.148146)*sailStates.p + (-0.498142)*sailStates.q + (-0.009692)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.335322)*sailStates.alpha + (-0.023350)*sailStates.beta + (-1.244633)*sailStates.p + (10.324729)*sailStates.q + (0.324538)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.524251)*sailStates.alpha + (-0.244201)*sailStates.beta + (8.634440)*sailStates.p + (-135.916275)*sailStates.q + (-1.531071)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (0.031149)*sailStates.alpha + (0.003758)*sailStates.beta + (-0.252226)*sailStates.p + (1.303644)*sailStates.q + (0.000550)*sailStates.r + (0.000168)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end