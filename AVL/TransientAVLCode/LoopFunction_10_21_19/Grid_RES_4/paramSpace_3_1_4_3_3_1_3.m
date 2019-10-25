function [aeroForces] = paramSpace_3_1_4_3_3_1_3(sailStates,airStates)

	CL = (4.154672)*sailStates.alpha + (-0.064225)*sailStates.beta + (-2.794949)*sailStates.p + (36.027699)*sailStates.q + (-0.403906)*sailStates.r + (0.010800)*sailStates.de;
	CD = -0.168370;
	CY = (0.022235)*sailStates.alpha + (-0.024187)*sailStates.beta + (-0.280874)*sailStates.p + (0.432842)*sailStates.q + (0.018455)*sailStates.r + (0.000093)*sailStates.de;

	Cl = (1.492664)*sailStates.alpha + (0.097765)*sailStates.beta + (-1.457814)*sailStates.p + (12.075342)*sailStates.q + (-0.422670)*sailStates.r + (0.000822)*sailStates.de;
	Cm = (-14.643996)*sailStates.alpha + (0.186280)*sailStates.beta + (9.755685)*sailStates.p + (-143.531296)*sailStates.q + (1.330662)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (-0.105735)*sailStates.alpha + (-0.010558)*sailStates.beta + (0.719076)*sailStates.p + (-4.038640)*sailStates.q + (-0.013480)*sailStates.r + (-0.000205)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end