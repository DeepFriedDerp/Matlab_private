function [aeroForces] = paramSpace_2_1_2_3_1_3_3(sailStates,airStates)

	CL = (4.184248)*sailStates.alpha + (0.085615)*sailStates.beta + (-2.795215)*sailStates.p + (36.011166)*sailStates.q + (0.412945)*sailStates.r + (0.010830)*sailStates.de;
	CD = -0.188090;
	CY = (-0.020623)*sailStates.alpha + (-0.024279)*sailStates.beta + (0.295806)*sailStates.p + (-0.432842)*sailStates.q + (0.019403)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.496321)*sailStates.alpha + (-0.104037)*sailStates.beta + (-1.457945)*sailStates.p + (12.074593)*sailStates.q + (0.446717)*sailStates.r + (0.000822)*sailStates.de;
	Cm = (-14.714672)*sailStates.alpha + (-0.323278)*sailStates.beta + (9.759151)*sailStates.p + (-143.531296)*sailStates.q + (-1.383537)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (0.098752)*sailStates.alpha + (-0.010763)*sailStates.beta + (-0.741149)*sailStates.p + (4.050069)*sailStates.q + (-0.013078)*sailStates.r + (0.000194)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end