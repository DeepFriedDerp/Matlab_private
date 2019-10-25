function [aeroForces] = paramSpace_3_4_2_3_1_2_2(sailStates,airStates)

	CL = (4.031605)*sailStates.alpha + (-0.076435)*sailStates.beta + (-2.542234)*sailStates.p + (34.722145)*sailStates.q + (0.456768)*sailStates.r + (0.010888)*sailStates.de;
	CD = 0.019450;
	CY = (-0.062140)*sailStates.alpha + (-0.024307)*sailStates.beta + (0.148146)*sailStates.p + (-0.498142)*sailStates.q + (-0.009692)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.186408)*sailStates.alpha + (-0.082442)*sailStates.beta + (-1.146935)*sailStates.p + (9.116162)*sailStates.q + (0.318177)*sailStates.r + (0.000198)*sailStates.de;
	Cm = (-14.524251)*sailStates.alpha + (0.244201)*sailStates.beta + (8.634440)*sailStates.p + (-135.916275)*sailStates.q + (-1.531071)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (0.055050)*sailStates.alpha + (0.003176)*sailStates.beta + (-0.258630)*sailStates.p + (1.382857)*sailStates.q + (0.000967)*sailStates.r + (0.000168)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end