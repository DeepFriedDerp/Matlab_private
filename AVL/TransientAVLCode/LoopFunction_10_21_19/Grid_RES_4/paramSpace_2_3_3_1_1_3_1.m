function [aeroForces] = paramSpace_2_3_3_1_1_3_1(sailStates,airStates)

	CL = (7.022027)*sailStates.alpha + (-0.179187)*sailStates.beta + (-1.641105)*sailStates.p + (25.040310)*sailStates.q + (2.450664)*sailStates.r + (0.010135)*sailStates.de;
	CD = -2.854830;
	CY = (-0.695694)*sailStates.alpha + (-0.025592)*sailStates.beta + (1.291434)*sailStates.p + (-1.915490)*sailStates.q + (0.084578)*sailStates.r + (-0.000407)*sailStates.de;

	Cl = (2.030871)*sailStates.alpha + (-0.622290)*sailStates.beta + (-0.461320)*sailStates.p + (2.146201)*sailStates.q + (2.319172)*sailStates.r + (-0.000810)*sailStates.de;
	Cm = (-16.763969)*sailStates.alpha + (0.705359)*sailStates.beta + (6.492673)*sailStates.p + (-113.694908)*sailStates.q + (-8.288096)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (2.671254)*sailStates.alpha + (-0.035304)*sailStates.beta + (-2.854172)*sailStates.p + (14.333920)*sailStates.q + (-0.033047)*sailStates.r + (0.000746)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end